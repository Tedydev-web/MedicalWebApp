using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;

namespace WebAppYte.Models
{
    public class BrainHealthChecker
    {
        private List<BrainRecord> _brainRecords;

        public BrainHealthChecker()
        {
            _brainRecords = LoadBrainRecords();
        }

        private List<BrainRecord> LoadBrainRecords()
        {
            var records = new List<BrainRecord>();
            var lines = File.ReadAllLines("WebAppYte/DataModels/brain.csv").Skip(1); // Skip header

            foreach (var line in lines)
            {
                var parts = line.Split(';');
                records.Add(new BrainRecord
                {
                    Age = int.Parse(parts[0]),
                    Hp = decimal.Parse(parts[1]),
                    Creatinine = decimal.Parse(parts[2]),
                    TotalBilirubin = decimal.Parse(parts[3]),
                    DirectBilirubin = decimal.Parse(parts[4]),
                    AlkalinePhosphotase = decimal.Parse(parts[5]),
                    Amylase = decimal.Parse(parts[6]),
                    Lipase = decimal.Parse(parts[7]),
                    Eyes = decimal.Parse(parts[8]),
                    Target = int.Parse(parts[9])
                });
            }

            return records;
        }

        public bool CheckForBrainIllness(HoSoSucKhoe patientRecord)
        {
            return _brainRecords.Any(br =>
                br.Age == patientRecord.age &&
                br.Hp == patientRecord.hp &&
                br.Creatinine == patientRecord.creatinine &&
                br.TotalBilirubin == patientRecord.Total_Bilirubin &&
                br.DirectBilirubin == patientRecord.Direct_Bilirubin &&
                br.AlkalinePhosphotase == patientRecord.Alkaline_Phosphotase &&
                br.Amylase == patientRecord.Amylase &&
                br.Lipase == patientRecord.Lipase &&
                br.Eyes == patientRecord.Eyes &&
                br.Target == 1);
        }

        private class BrainRecord
        {
            public int Age { get; set; }
            public decimal Hp { get; set; }
            public decimal Creatinine { get; set; }
            public decimal TotalBilirubin { get; set; }
            public decimal DirectBilirubin { get; set; }
            public decimal AlkalinePhosphotase { get; set; }
            public decimal Amylase { get; set; }
            public decimal Lipase { get; set; }
            public decimal Eyes { get; set; }
            public int Target { get; set; }
        }
    }
}
