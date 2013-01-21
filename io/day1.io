"Hello World" println

postOffice := Object clone
postOffice sendMail := method ("Wait in line!" println)
postOffice getMail := method("No mail for you!" println)
"Calling A Slot By Name..." println
postOffice getSlot("sendMail") call

postOffice doThis := method ( call target doMessage( call message argAt(0) ) )
"Calling A Slot By Indirection…" println
postOffice doThis(getMail)

