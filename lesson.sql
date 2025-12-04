-- List patients in Kingston



SELECT 
    PatientId, 
    AdmittedDate, 
    DischargeDate,
    DATEDIFF(Day, AdmittedDate, DischargeDate ) As [Length Of Stay],
    DATEADD(Week, -2, AdmittedDate) As [Reminder Date], -- 2 weeks before admittance date
    DATEADD(Month, 3, DischargeDate) As [Appointment Date], -- 3 months after discharge date
    Hospital,
    Ward,
    Tariff
FROM PatientStay
WHERE Hospital IN ('Kingston', 'Pruh')
-- ORDER BY Hospital ASC, Ward ASC, Tariff DESC
ORDER BY PatientId DESC

-- And Ward Like '%Surgery%'
-- And AdmittedDate BETWEEN '2024-02-27' and '2024-03-02'
-- And Tariff < 6
-- OR Hospital = 'PRUH'
-- AND Ward = 'Dermatology'

--summarise Data

SELECT
    Hospital
    ,Ward
    ,COUNT(*) AS NumberOfPatients
    ,SUM(Tariff) AS TotalTariff

FROM
    PatientStay
GROUP BY
    Hospital, Ward

SELECT * FROM PatientStay
SELECT * FROM DimHospital

SELECT
    ps.PatientId
    ,ps.AdmittedDate
    ,ps.Hospital
    ,h.Hospital
    ,h.HospitalType
    ,h.HospitalSize
FROM
    PatientStay ps LEFT JOIN DimHospitalBad h ON ps.Hospital = h.Hospital


Select * from DimHospitalBad