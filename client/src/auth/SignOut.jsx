import React from 'react'
import '../styles/header.css';

class SignOut extends React.Component{

  constructor(){
    super()
    this.signOut = this.signOut.bind(this)
  }
  
  signOut(event){
    event.preventDefault()
    const request = new XMLHttpRequest()
    request.open("DELETE", this.props.url)
    request.setRequestHeader("Content-Type", "application/json")
    request.withCredentials = true
    request.onload = () => {
      console.log('signed out', request.status)
      if (request.status === 204){
        this.props.onSignOut(null)
      }
    }
    request.send(null)
  }

  render() {
    return (
       <div>
        <button id="sign-out" onClick={this.signOut}>Sign Out</button>
      </div>
    )
  }
}

export default SignOut