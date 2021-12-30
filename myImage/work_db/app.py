import mysql.connector
import json
from flask import Flask, flash, redirect, render_template, request, session, abort
from random import randint


app = Flask(__name__)

@app.route('/home')
def hello():
  return 'Hello, Friend!\n This is possible due to Poocco\n'

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
  return render_template('hello.html', **locals())


@app.route('/get_points', methods =["GET", "POST"])
def get_points() :
  if request.method == "POST":
    try:
      h_num_id = int(request.form.get("num_id"))

      mydb_conn = mysql.connector.connect(
        host="database_ms",
        user="root",
        password="gesl0",
        database="bullet_points"
      )
      cursor = mydb_conn.cursor()

      sql = "SELECT * FROM points where id = %s;"
      cursor.execute(sql, (h_num_id,))

      results = cursor.fetchall()
    
      cursor.close()

      return render_template("print_point.html", point=results[0])

    except mysql.connector.Error as error:
      return ("Failed to get record from MySQL table: {}".format(error))

  return render_template("print.html")

@app.route('/write_points', methods =["GET", "POST"])
def writting():
  if request.method == "POST":
    # getting input with name = fname in HTML form
    h_name = request.form.get("fname")
    h_desc = request.form.get("desc")

    mydb_conn = mysql.connector.connect(
      host="database_ms",
      user="root",
      password="gesl0",
      database="bullet_points"
    )
    cursor = mydb_conn.cursor()
    sql = "INSERT INTO points (name, description) values (%s, %s)"
    values = (h_name, h_desc)
    cursor.execute(sql, values)
    mydb_conn.commit()

    sql_id = "SELECT * FROM points where name = %s and description = %s;"
    cursor.execute(sql_id, values)
    results = cursor.fetchall()

    cursor.close()

    return render_template("write_point.html", point=results[0])

  return render_template("write.html")

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
  mydb_conn.commit()
  
  cursor.close()

  return 'Database is created and it is empty.\n'


if __name__ == "__main__":
  app.run(host = '0.0.0.0', port = 5000)
