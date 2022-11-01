from fastapi import FastAPI
app = FastAPI()
import subprocess

@app.get("/")
async def root():
    return {"Server": "I'm alive"}
    
@app.get("/dl/{id_link}")
async def root():
    cmd = 'tidal-dl -l {id_link}'
    sp = subprocess.Popen(cmd,shell=True)
    rc=sp.wait()
    return {"Server": sp}