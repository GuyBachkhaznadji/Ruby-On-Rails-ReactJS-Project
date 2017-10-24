import React, { Component } from 'react';
import '../styles/profile_list.css';

class ProfileList extends Component {
  
    handleChange(event){
    this.props.handleProfileSelected(event.target.value);
  }
  
    render() {

    const options = this.props.profiles.map( (profile, index) => {
      return(
        <option 
        value={index} 
        key={index}
        oid={profile._id.$oid}>{profile.title}</option>
      )
    })


    return (
      <article className="profile-list">
        <h2>Profiles</h2>
            <select 
            id="profiles"
            onChange={ this.handleChange.bind(this)}>
                <option>Select a Profile</option>
                {options}
            </select>
      </article>

      
    );
  }
}

export default ProfileList;
