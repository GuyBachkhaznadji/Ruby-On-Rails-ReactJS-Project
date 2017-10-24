import React, { Component } from 'react';
import logo from '../images/lighthouse_logo.png';
import SignOut from '../auth/SignOut';
import '../styles/header.css';

class Header extends Component {
  render() {


    var signOut = null
    if(this.props.currentUser){
        signOut = <SignOut id="sign-out" url={this.props.url + "users/sign_out.json"} onSignOut={this.props.setUser}></SignOut>
    }
   
    return (
    <header className="App-header">
        <section className="logo-motto">
            <img src={logo} className="App-logo" alt="logo" />
            <p className="App-title">Illuminating Your Search</p>
        </section>
        <section className="buttons">
            {signOut}
        </section>
    </header>
    );
  }
}

export default Header;
