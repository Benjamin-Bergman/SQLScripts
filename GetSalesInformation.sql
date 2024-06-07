SET @dealership = 1;
SET @start = '2024-6-1 0:00:00';
SET @end = '2024-6-30 23:59:59';

SELECT
	v.vin,
    s.id IS NOT NULL AS is_sale,
    CASE WHEN s.id IS NOT NULL THEN s.id ELSE l.id END AS id,
    CASE WHEN s.timestamp IS NOT NULL THEN s.timestamp ELSE l.timestamp END AS timestamp,
    s.sales_tax,
    s.recording_fee,
    s.processing_fee,
    s.financed,
    l.expected_ending_value,
    l.lease_fee,
    l.payment_term
FROM vehicles v
LEFT JOIN sales_contracts s ON s.vin = v.vin
LEFT JOIN lease_contracts l ON l.vin = v.vin
LEFT JOIN inventory i ON v.vin = i.vin

WHERE (
	(s.timestamp IS NOT NULL AND s.timestamp BETWEEN @start AND @end)
    OR
    (l.timestamp IS NOT NULL AND l.timestamp BETWEEN @start AND @end)
) AND i.dealership_id = @dealership;
