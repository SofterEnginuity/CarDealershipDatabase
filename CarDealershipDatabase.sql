-- 1.)
 SELECT * FROM dealerships;

-- 2.)
SELECT v.vin, v.year, v.make, v.model, v.color, v.mileage, v.price
FROM vehicles v
JOIN inventory i ON v.vin = i.vin
WHERE i.dealershipID = 1;


-- 3.)
SELECT v.vin, v.year, v.make, v.model, v.color, v.mileage, v.price
FROM vehicles v
JOIN inventory i ON v.vin = i.vin
WHERE v.vin = '1G1ZE5ST5H';

-- 4.)
SELECT d.dealershipId, d.name, d.address, d.phone
FROM dealerships d
JOIN inventory i ON d.dealershipID = i.dealershipID
JOIN vehicles v ON i.vin = v.vin
WHERE v.vin = '1G1ZE5ST5H';

-- 5.)
SELECT d.dealershipId, d.name, d.address, d.phone
FROM dealerships d
JOIN inventory i ON d.dealershipID = i.dealershipID
JOIN vehicles v ON i.vin = v.vin
WHERE v.make = 'nissan' AND v.model = 'altima';

-- 6.)
SELECT s.contractId, s.vin, s.dealershipId, s.saleDate, s.customerName, s.customerEmail, 
s.salesTaxRate, s.recordingFee, s.processingFee, s.financed
FROM salecontracts s
WHERE s.dealershipId = 1
  AND s.saleDate BETWEEN '2024-01-01' AND '2024-04-30';



