# livebox.sh

This small sh script can be used to fetch some informations about the connection state of your Livebox V4 using the builtin API.

## Usage

Run the script with `livebox.sh ip|ip6|wan`.
- `ip` will get the IPV4 adress of your Livebox
- `ip6` will get the IPV6 adress of your Livebox
- `wan` will get the link state of your Livebox

## Dependencies

- [curl](https://github.com/curl/curl)
- [jq](https://github.com/stedolan/jq)
