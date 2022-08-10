BEGIN {
    print "Current users and shells"
    print " UserID \t Shell"
    print "-------- \t --------"
    FS=":"
}

{
    print $1 "     \t " $7
}

END {
    print "End of user list"
}