# Docker

```bash
cd myImage
docker build -ti <name> .
docker run -ti <name>
```
-t indicates the tag to apply to the image.
. indicates the location of the build context.

```bash
docker-compose -f docker-compose.yml up --build

git tag -a v1.0.2  -m "first tag"
git push origin v1.0.2
```

Naredila sem spletno aplikacijo v python flask, ki je razdeljena na dva dela. En del je za pisanje in prejemanje napisanega, drugi del je pa zaradi manjše možnosti napake, za kreiranje in počiščenje baze. Aplikaciji imata bazo MySQL.

# Uporaba
Preko git clone ali Download zip dobiš potrebne datoteke.

```bash
cd myImage
docker-compose -f docker-compose.yml up --build
```
V brskalniku greš na http://localhost:5000/ ali http://localhost:5001/, kjer so splošna navodila.

Obvezno moraš pred prvo uporabo iti na http://localhost:5001/create_db, to je kot neka registracija.

## Potencialni problemi

Če delaš v virtualki ali pa daješ svoj računalnik v spanje, preden ponovno zaženeš ukaz `docker-compose -f docker-compose.yml up --build` zaženi `sudo service docker restart`, saj tako ponovno dns resolution znotra docker-ja pravilno dela. 