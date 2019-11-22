Select ID1, ev.STRM, ev.WITHDRAW_CODE, ev.ACAD_LEVEL_BOT, ev.ACAD_PROG_PRIMARY, ev.ACADEMIC_LOAD, ad.admit_term, ad.admit_type, ad.prog_action, np.homedatabase, adf.admit_term, adf.admit_type, adf.prog_action, evs.STRM, evs.WITHDRAW_CODE, evs.ACAD_LEVEL_BOT, evs.ACAD_PROG_PRIMARY, evs.ACADEMIC_LOAD
from Entry
INNER JOIN NYUEnrollmentView ev on entry.EntryID=ev.entryID
INNER JOIN NYUPerson np on entry.id3=np.emplid
left outer join nyuadmissionsimportview ad on ad.emplid=ev.emplid and ad.admit_term='1204' and ad.admit_type IN ('NFR','TR2','TR4','CGA')
left outer join nyuadmissionsimportview adf on adf.emplid=ev.emplid and adf.admit_term IN ('1196','1198')
left outer join nyuenrollmentview evs on entry.entryid=evs.entryid and evs.strm='1204'
left outer join booking b on entry.entryid=b.bookingid and termsessionid NOT IN (5,7,66,70,75,79,83,88,91,96,99,65,68,73,77,82,85,90,94,98) and b.entrystatusenum in (1,2,5,10)
WHERE ev.STRM in (1198) and ev.ACAD_PROG_PRIMARY LIKE 'u%' and ev.ACAD_PROG_PRIMARY NOT IN ('UISHG','UHABU') and ad.admit_term IS NULL and ev.withdraw_code <> 'WDR' and b.bookingid IS NULL and np.homedatabase=0 and adf.admit_term IS NULL and evs.academic_load<>'N' and evs.strm IS NOT NULL and evs.withdraw_code <> 'WDR'
order by ev.ACAD_PROG_PRIMARY
