from fortigate_api import FortiGate
from getpass import getpass, getuser
from timeit import default_timer as t


def token():
    return FortiGate(host=input("Hostname/IP: "), username=getuser(), password=getpass("Password: "))


def search(api):
    response = api.get_results(url="/api/v2/cmdb/user/device")
    inventory = set()
    keywords = ['WAW', 'Canon', 'FAP', 'Konica']
    for x in response:
        for keyword in keywords:
            if keyword in x["q_origin_key"]:
                inventory.add(x["q_origin_key"])
    return inventory


def remove(api, devices):
    for y in devices:
        print(f"{y} ended with {api.delete(url=f"/api/v2/cmdb/user/device/{y}")}")


if __name__ == "__main__":
    start = t()
    fgt = token()
    listed = search(fgt)
    remove(api=fgt, devices=listed)
    fgt.logout()
    end = t()
    print(end - start)
