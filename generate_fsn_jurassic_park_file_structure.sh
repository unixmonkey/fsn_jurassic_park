# Usage genfile "schedule.0" 1024
#   creates schedule.0 at 1024 bytes
genfile() {
  echo "creating file $1"
  head -n $2 </dev/urandom > "$1"
}

# Usage: genfiles "schedule" 24 3200
#   creates schedule.0 through schedule.24 at 3200 bytes each
genfiles() {
   n=0
   while [ $n -le $2 ]; do
     genfile "$1.$n" $3
     n=$((n+1))
   done
}

# Usage: gentext "schedule.0"
#   creates a text file with only the letter "a" in it
gentext() {
   n=0
   while [ $n -le $2 ]; do
     echo "generating $1.$n"
     echo "a" > "$1.$n"
     n=$((n+1))
   done
}

# Usage: makegreen "schedule.0"
#   touches the file to make it created at 4 months ago (green in FSN)
makegreen() {
  curyear=$(date '+%Y')
  curmonth=$(date '+%m')
  newmonth=$(echo "$curmonth - 3" | bc -l)
  if [ $newmonth -lt 1 ]; then
    newmonth=$(echo "$newmonth + 12" | bc -l)
    curyear=$(echo "$curyear - 1" | bc -l)
  fi
  if [ $newmonth -lt 10 ]; then
    newmonth="0$newmonth"
  fi
  curday=$(date '+%d')
  if [ $curday -gt 28 ]; then
    curday="28"
  fi
  newdate=$(date "+$curyear$newmonth$curday%H%M.%S")
  echo "setting date to $newdate for $1"
  touch -t $newdate $1
}

populate_park_dirs() {
  mkdir -p park
  for dir in Airport.Flights Animals Physical.Plant Research Zoology; do
    echo "creating dir park/$dir"
    mkdir -p park/$dir
  done

  for dir in Airport.Flights Animals Physical.Plant Research; do
    for subdir in 0 1 2 3; do
      echo "creating dir park/$dir/$subdir"
      mkdir -p park/$dir/$subdir
    done
  done

  for dir in Animal.Feeding Physical.Security Telephone Tour.Control; do
    echo "creating dir park/Zoology/$dir"
    mkdir -p park/Zoology/$dir
  done

  for dir in Aviation Personnel Schedule; do
    echo "creating dir park/Zoology/Physical.Security/$dir"
    mkdir -p park/Zoology/Physical.Security/$dir
  done

  mkdir -p park/Zoology/Physical.Security/Aviation/Helipad
}
populate_park_dirs

generate_files() {
  genfiles park/Airport.Flights/flights 50 3800
  genfiles park/Animals/animals 40 3100
  genfiles park/Research/research 50 3800
  genfiles park/Physical.Plant/plant 50 3800
  for dir in 0 1 2 3; do
    genfiles park/Airport.Flights/$dir/flight 36 4000
    genfiles park/Animals/$dir/specimin 36 3800
    genfiles park/Research/$dir/research 36 4000
    genfiles park/Physical.Plant/$dir/sector 16 4000
  done

  genfiles park/Zoology/access 16 1500
  genfiles park/Zoology/personnel 26 1500
  gentext park/Zoology/Animal.Feeding/feeding 50 5

  for file in Armory Chemical Dilo.Dock Embryo.Storage Fence Hammonds.Lodge Helipad Hotel Main.Gate Perimeter Pharmaceutical T-Rex Vehicles Video Visitors.Center; do
    echo "creating file park/Zoology/Physical.Security/$file"
    echo "a" > park/Zoology/Physical.Security/$file
  done

  genfiles park/Zoology/Physical.Security/Aviation/aviation 40 3900
  genfiles park/Zoology/Physical.Security/Aviation/Helipad/helipad 16 3100
  genfiles park/Zoology/Physical.Security/Personnel/personnel 56 2300
  genfiles park/Zoology/Physical.Security/Schedule/schedule 40 1800
  genfiles park/Zoology/Telephone/telephone 24 1800
  genfiles park/Zoology/Tour.Control/tour 24 1800
  genfiles park/Zoology/Animal.Feeding/feeding 24 1800
}
generate_files

growfiles() {
  genfile park/Zoology/Physical.Security/Aviation/aviation.1 8000
  genfile park/Zoology/Physical.Security/Aviation/aviation.22 8000
  genfile park/Zoology/Physical.Security/Aviation/aviation.33 8000
  genfile park/Zoology/Physical.Security/Personnel/personnel.7 7000
  genfile park/Zoology/Physical.Security/Personnel/personnel.52 8000
  genfile park/Zoology/Physical.Security/Personnel/personnel.53 7000
  genfile park/Zoology/Physical.Security/Personnel/personnel.54 8000
  genfile park/Zoology/Physical.Security/Schedule/schedule.7 8000
  genfile park/Zoology/Physical.Security/Schedule/schedule.10 8000
}
growfiles

changecolors() {
  makegreen park/Zoology/Physical.Security/Aviation/aviation.33
  makegreen park/Zoology/Physical.Security/Personnel/personnel.0
  makegreen park/Zoology/Physical.Security/Personnel/personnel.15
  makegreen park/Zoology/Physical.Security/Schedule/schedule.16
  makegreen park/Zoology/Physical.Security/Schedule/schedule.23
  makegreen park/Zoology/Physical.Security/Schedule/schedule.34
}
changecolors
