from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello, Amit! Congratulations your little app is working fine :)'

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=8080, debug=True)