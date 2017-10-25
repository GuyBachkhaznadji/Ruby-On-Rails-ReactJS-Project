import React from 'react'
import SignIn from './SignIn'
import SignUp from './SignUp' 
import SignOut from './SignOut'
import '../styles/login.css';

class LoginBox extends React.Component {

  fetchUser(){
    console.log("fetching user")
    const request = new XMLHttpRequest()
    request.open("GET", this.props.url + "users.json", true)
    // request.setRequestHeader("Content-Type", "application/json")
    request.withCredentials = true

    request.onload = () => {

      if(request.status === 200){

        console.log('request.responseText', request.responseText)
        const receivedUser = JSON.parse(request.responseText)
        this.props.setUser(receivedUser)
      }else if(request.status === 401){
        this.props.setUser(null)
      }
    }
    request.send(null)
  }

  componentDidMount(){
    this.fetchUser()
  }

  render () {
      var mainDiv = <div className="login">
        <h2>Login To Get Started</h2>
        <article className="login-forms">
          <SignIn url={this.props.url + "users/sign_in.json"} onSignIn={this.props.setUser}></SignIn>
          {/* <SignUp url={this.props.url + "users.json"} onSignUp={this.props.setUser}></SignUp> */}
        </article>
      </div>
      if(this.props.currentUser){
        mainDiv = <div>
          <h4> Welcome {this.props.currentUser.email}</h4>
          <SignOut url={this.props.url + "users/sign_out.json"} onSignOut={this.props.setUser}></SignOut>
        </div>
      }
      return (
        <div>
          { mainDiv }
        </div>
      ) 
  }
}

export default LoginBox