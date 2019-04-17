echo "Starting Elevation Server ! " > /home/alarm/project_server/boot/log.txt

cd /home/alarm/project_server/serverSide/
make runc -j4

