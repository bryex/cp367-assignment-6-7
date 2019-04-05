#!/bin/bash

# Task 2 - birthdaycountdown.sh
# -----------------------------

echo "Starting birthdaycountdown.sh..."
echo

# Constants
SEC_IN_DAY=86400

# Greet user 
user=$(whoami)
echo "Hello $user."
echo

# User Input
read -p "Enter the month of your birth (MM): " b_month
read -p "Enter the day of your birth (DD): " b_day
echo

# User birthday
echo "Birth date   (MM/DD): $b_month/$b_day"

# Current Date
curr_month=$(date +'%m')
curr_day=$(date +'%d')
year=$(date +'%y')
echo "Current date (MM/DD): $curr_month/$curr_day"
echo

# Birthday passed
if ((  $curr_month > $b_month ))
then 
    ((year+=1))
elif (( $curr_month == $b_month ))
then 
    if (( $curr_day > $b_day )) 
    then
        ((year+=1))
    fi
fi

# Convert dates to epoch
current_date=$(date +%s) 
birth_date=$(date -j -f "%d-%m-%y" $b_day-$b_month-$year +%s)

# Date difference 
(( epoch_days_until_birthday = birth_date - current_date ))
days_until_birthday=$((epoch_days_until_birthday/SEC_IN_DAY))

#Special Dates
if (($curr_month == 12))
then
    if (($curr_day == 25))
    then
	echo "Merry Christmas"
    fi
elif ((curr_month == 10))
then
    if (($curr_day == 31))
    then
	echo "Happy Halloween"
    fi
elif ((curr_month == 7))
then
    if (($curr_day == 1))
    then
	echo "Happy Canada Day"
    fi
elif ((curr_month == 3))
then
    if (($curr_day == 17))
    then
	echo "Happy St. Patricks Day"
    fi
fi

# Print output
if (( $days_until_birthday == 0 ))
then 
    echo "Happy Birthday!"
elif (( $days_until_birthday == 1 ))
then 
    echo "Tomorrow is your birthday."
else
    echo "There are $days_until_birthday days until your birthday."
fi

echo
echo "...ending birthdaycountdown.sh"
