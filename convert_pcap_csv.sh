#!/bin/bash

pcap_file="$1"
[[ ! -f "${pcap_file}" ]] && echo "PCAP file ${pcap_file} does NOT exist!" && exit 255

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"  # On the same directory.
echo ">>> Script dir: ${script_dir}"

output_dir="$2"


## Clean
cancel() {
	echo "+++ Converter is being canceled +++"
	echo "+++ The last conversion, ${pcap_file}, is not completed!"
	echo
	exit 0
}
trap 'cancel' INT TERM


## Convert
echo "+++ CICFlowMeter PCAP-to-CSV Converter +++"
echo "    Input file: ${pcap_file}"
echo "    Output dir: ${output_dir}"

# CICFlowMeter-3.0/bin/CICFlowMeter
# cic="${script_dir}"/CICFlowMeters/CICFlowMeter-3.0/bin/CICFlowMeter
cic="${script_dir}"/CICFlowMeters/CICFlowMeter-4.0/bin/CICFlowMeter

"${cic}" "${pcap_file}" "${output_dir}"