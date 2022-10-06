from flask import render_template, redirect, request, session, flash
from flask_app import app
from flask_bcrypt import Bcrypt
from flask_app.models.user_models import User

bcrypt = Bcrypt(app)

@app.route('/')
def index():
    return render_template('log_reg.html')

@app.route('/registrar_usuario', methods=['POST'])
def registro():

    if not User.validacion(request.form):
        return redirect('/')
    
    pw_hash = bcrypt.generate_password_hash(request.form['password'])
    print(pw_hash)
    data = {
        'first_name':request.form['first_name'],
        'last_name':request.form['last_name'],
        'email':request.form['email'],
        'password':pw_hash
    }
    usuario_id = User.ingreso(data)
    # guardamos el id del usuario registrado en la sesion para empezar a darle seguimiento
    session ['usuario_id'] = usuario_id
    return redirect ('/welcome')

@app.route('/login', methods=['POST'])
def login():
    usuario_loggeado = User.validar_login(request.form)
    print(usuario_loggeado, 'QUE CONTIENES ESTO_')
    if not usuario_loggeado[0]:
        return redirect("/")
    # guardamos el id del usuario registrado en la sesion para empezar a darle seguimiento
    session['usuario_id'] = usuario_loggeado[1].id
    return redirect('/welcome')


@app.route('/welcome')
def welcome():
    data = {
        'id':session['usuario_id']
    }
    usuario_ingreso = User.obtener_un_usuario(data)

    return render_template('datos.html', usuario_ingreso=usuario_ingreso)
