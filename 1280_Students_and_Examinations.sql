SELECT 
    st.student_id, 
    st.student_name, 
    su.subject_name, 
    CASE 
        WHEN e.attended_exams IS NULL THEN 0 
        ELSE e.attended_exams 
    END AS attended_exams
FROM Students st
JOIN Subjects su
ON 1
LEFT JOIN (
    SELECT 
        *, 
        COUNT(*) AS attended_exams 
    FROM Examinations 
    GROUP BY student_id, subject_name) e
ON 
    st.student_id = e.student_id 
    AND su.subject_name = e.subject_name
GROUP BY student_name, subject_name
ORDER BY student_id, subject_name