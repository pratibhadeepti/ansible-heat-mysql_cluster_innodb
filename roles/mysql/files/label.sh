lbl=$(xfs_admin -l /dev/vdb)
if [ -z $lbl ]; then
      xfs_admin -L "mysqldata" /dev/vdb
      lbl_new=$(xfs_admin -l /dev/vdb)
      if [ ! -z $lbl_new ]; then
        echo "ok"
        else
          echo "no"
    fi
      else
        echo "ok"
    fi