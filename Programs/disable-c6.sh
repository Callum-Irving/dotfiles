# See https://www.reddit.com/r/Amd/comments/7tkigu/automating_disabling_of_c6_states_in_arch_linux/

#!/bin/sh
if [ "${1}" == "post" ]; then

  # Disable c6 coming out of sleep
  /home/callum/Programs/ZenStates-Linux/zenstates.py --c6-disable
fi

