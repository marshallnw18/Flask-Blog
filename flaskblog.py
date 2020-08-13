from flask import Flask, render_template, url_for  
app = Flask(__name__)

posts = [
    {
        'author': 'Nick Marshall',
        'title': 'Blog Post 1',
        'content': 'First post content',
        'date_posted': 'August 13, 2020'
    },
    {
        'author': 'Jane Doe',
        'title': 'Blog Post 2',
        'content': 'Second post content',
        'date_posted': 'August 13, 2020'
    }
]


@app.route("/")
@app.route("/home")
def home():
    """
    instead of passing straight HTML into the return statement, we can use the render_template() function to
    return the home page's html template that was created in ./templates/home.html
    """
    return render_template('home.html', posts=posts) 

@app.route("/about")
def about(): 
    return render_template('about.html', title='About This Blog')

if __name__ == '__main__':
    app.run(debug=True)