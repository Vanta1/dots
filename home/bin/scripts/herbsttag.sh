update_active_workspaces() {
  eww update workspace1_has_client="$(herbstclient list_clients --tag=1)"
  eww update workspace2_has_client="$(herbstclient list_clients --tag=2)"
  eww update workspace3_has_client="$(herbstclient list_clients --tag=3)"
  eww update workspace4_has_client="$(herbstclient list_clients --tag=4)"
  eww update workspace5_has_client="$(herbstclient list_clients --tag=5)"
  eww update workspace6_has_client="$(herbstclient list_clients --tag=6)"
  eww update workspace7_has_client="$(herbstclient list_clients --tag=7)"
  eww update workspace8_has_client="$(herbstclient list_clients --tag=8)"
  eww update workspace9_has_client="$(herbstclient list_clients --tag=9)"
}

filter() {
	while read line; do
		if [[ $line == *"tag_changed"* ]]; then
			echo $line | cut -d " " -f 2
    elif [[ $line == *"tag_flags"* ]]; then
      update_active_workspaces
    fi
	done
}

herbstclient -i | filter
