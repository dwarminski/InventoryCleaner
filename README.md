# FortiGate Inventory Cleaner

This script connects to a FortiGate firewall using the [fortigate-api](https://pypi.org/project/fortigate-api/) Python library and automates the process of searching and removing specific devices from the firewall's user device database.

## Features

- Connects to a FortiGate firewall using username and password authentication.
- Searches for devices in the `/api/v2/cmdb/user/device` endpoint.
- Filters devices based on predefined keywords.
- Removes matched devices from the firewall.
- Logs the execution time.

## Requirements

- Python 3.x
- [fortigate-api](https://pypi.org/project/fortigate-api/)

## Installation

Ensure you have Python installed and then install the required package:

```sh
pip install fortigate-api
```

## Usage

Run the script in a terminal:

```sh
python main.py
```

### Workflow

1. The script prompts for the FortiGate hostname/IP and password.
2. It retrieves the list of devices from FortiGate.
3. It searches for devices matching specific keywords.
4. It removes the identified devices from the system.
5. It logs out from the FortiGate firewall and displays execution time.
