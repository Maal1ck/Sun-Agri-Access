SELECT 
    regions.id,
    regions.nom, 
    ROUND(AVG(ouvrages."Profondeur")::numeric, 2) as prof_moy,
    regions.geom -- On garde la forme du polygone
FROM 
    regions 
JOIN 
    ouvrages ON ST_Intersects(regions.geom, ouvrages.geom)
GROUP BY 
    regions.id, regions.nom, regions.geom -- On doit tout grouper