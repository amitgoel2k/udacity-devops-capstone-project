from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello, Amit! Great that you have deployed this in AWS'

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=8080, debug=True)