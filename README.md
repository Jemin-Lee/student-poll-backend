# studentpoll/backend

## Setup

1) Create a `.env` file in this directory. Make sure this includes:

* Host: `localhost`
* User: (your usercode)
* Password: (your password which should be your student number)
* Database: your database name in dbadmin. Mine was "sal180_main"

2) Open terminal and run `npm install`. Make sure you have Node.js installed on your computer. You may also need to install additional dependencies if any errors occur.

3) Run: `ssh -L 3306:db2.csse.canterbury.ac.nz:3306 username@linux.cosc.canterbury.ac.nz`. Make sure to replace `username` with your usercode.

4) In a seperate terminal window, run `node server.js` and the connetion should be successful


