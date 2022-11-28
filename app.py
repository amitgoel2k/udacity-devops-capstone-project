from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello, Mike! Great to see you deployed the third version of this service'

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=8080, debug=True)