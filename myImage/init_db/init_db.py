import mysql.connector
import json
from flask import Flask, flash, redirect, render_template, request, session, abort
from random import randint

app = Flask(__name__)

@app.route('/')
def hello_world():
  quotes = [ "'If people do not believe that mathematics is simple, it is only because they do not realize how complicated life is.' -- John Louis von Neumann ",
      "'Computer science is no more about computers than astronomy is about telescopes' --  Edsger Dijkstra ",
      "'To understand recursion you must first understand recursion..' -- Unknown",
      "'You look at things that are and ask, why? I dream of things that never were and ask, why not?' -- Unknown",
      "'Mathematics is the key and door to the sciences.' -- Galileo Galilei",
      "'Not everyone will understand your journey. Thats fine. Its not their journey to make sense of. Its yours.' -- Unknown"  ]
  randomNumber = randint(0, len(quotes) - 1)
  quote = quotes[randomNumber]
  return render_template('text.html',quote=quote)</string:quote>

@app.route('/create_db')
def db_init():
  mydb_conn = mysql.connector.connect(
    host="database_ms",
    user="root",
    password="gesl0"
  )
  cursor = mydb_conn.cursor()

  cursor.execute("DROP DATABASE IF EXISTS bullet_points")
  cursor.execute("CREATE DATABASE bullet_points")
  cursor.close()

  mydb_conn = mysql.connector.connect(
    host="database_ms",
    user="root",
    password="gesl0",
    database="bullet_points"
  )
  cursor = mydb_conn.cursor()

  cursor.execute("DROP TABLE IF EXISTS points")
  cursor.execute("CREATE TABLE points (id int NOT NULL AUTO_INCREMENT, name VARCHAR(255), description text(2000), PRIMARY KEY (id))")
  cursor.execute("INSERT INTO points (name, description) values ('Nisargaa','Upadhdddddddyay')")
  mydb_conn.commit()
  
  cursor.close()

  return 'Database is created and it is empty.\n'

if __name__ == "__main__":
  app.run(host ='0.0.0.0', port=5001)
