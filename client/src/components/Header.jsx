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
        <section className="logo-title">
            <img src={logo} className="App-logo" alt="logo" />
            <section id="title-motto">
                <p className="App-title">Lighthouse</p>
                <p id="motto">Illuminating Your Search</p>
            </section>
        </section>
        <section className="buttons">
            {signOut}
        </section>
        <article id="explainer">
            <h5>Lighthouse makes searching easier</h5>
            <h5>It also helps teach you what a good search might look light for skills you aren’t as familiar with. All you need to do is select a Profile, pop in your Job Description and hit Search and you’ll be given a search to work with.</h5>
          </article>
    </header>
    );
  }
}

export default Header;
