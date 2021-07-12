from typing import Optional
from fastapi import FastAPI
import socket

app = FastAPI()


@app.get("/where-am-i")
def get_host():
    try:
        host_name = socket.gethostname()
        host_ip = socket.gethostbyname(host_name)
        return f"Hi! This is {host_name}, and your IP address is {host_ip}"
    except:
        return f"Unable to get Hostname and IP"
