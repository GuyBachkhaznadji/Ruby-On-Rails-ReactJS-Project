import React, { Component } from 'react';
import Functionality from './Functionality.jsx';
import Header from '../components/Header.jsx';
import LoginBox from '../auth/LoginBox'
import '../styles/app.css';

class App extends Component {
  constructor(props){
    super(props);
    this.state = {
      isModalOpen: false,
      currentUser: null
    };
    this.setUser = this.setUser.bind(this)
    this.openModal = this.openModal.bind(this);
    this.closeModal = this.closeModal.bind(this);
  }

  setUser(user){
    this.setState({currentUser:user, favlist:[]})
  }

  openModal() {
    this.setState({ isModalOpen: true })
  }

  closeModal() {
    this.setState({ isModalOpen: false })
}

// componentDidMount() {
//     window.fetch('api/profiles')
//       .then(response => response.json())
//       .then(json => console.log(json))
//       .catch(error => console.log(error))
//   }
  
  render() {
    var functionality = <article>
    <LoginBox className="login"
        url="/"
        setUser={this.setUser}
        currentUser={this.state.currentUser}/>
    </article>
    
    if (this.state.currentUser){
      functionality =  <Functionality openModal={this.openModal}
        closeModal={this.closeModal}
        isModalOpen={this.state.isModalOpen}/>
    }

    return (
      <div>
        <Header
        url="/"
        setUser={this.setUser}
        currentUser={this.state.currentUser}/>
          {functionality}
      </div>
    );
  }
}

export default App;
