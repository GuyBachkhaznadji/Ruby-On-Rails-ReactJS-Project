import React, { Component } from 'react';
import JobDesc from '../components/JobDesc.jsx';
import ProfileList from '../components/ProfileList.jsx';
import Search from '../components/Search.jsx';
import FeedbackForm from '../components/FeedbackForm.jsx';
import '../styles/app.css';

class Functionality extends Component {
  constructor(props){
    super(props);
    this.state = {
      profiles: [],
      selectedProfile: undefined,
      jobDesc: undefined,
      profileIndex: undefined,
      conciseSearch: undefined,
      comprehensiveSearch: undefined,
      searches: undefined,
      conciseFlag: undefined,
      compFlag: undefined
    };
    this.flagSearch = this.flagSearch.bind(this);
  }

  handleProfileSelected(index){
    this.setState( { selectedProfile: this.state.profiles[index] });
    this.setState( { profileIndex: index });
  }

  handleJobDescSubmitted(usersJobDesc){
    
    if (this.state.selectedProfile){
      const jobDataObject = {profileIndex: this.state.profileIndex, title: this.state.selectedProfile.title, jobDesc: usersJobDesc };    
      this.setState( { jobDesc: usersJobDesc, compFlag: undefined, conciseFlag: undefined });
      this.getSearches(jobDataObject);
    } else {
      alert("Please select a profile");
    }
  }

  handleRate(rating, key){
    const searches = this.state.searches;
    
    if(rating === "Good" ){
      searches[key] = 1;
    } else if (rating === "Bad"){
      searches[key] = -1;
    }
    this.setState( { searches: searches });
    this.updateSearch(searches);
    this.flagSearch(rating, key)
 
  }

  flagSearch(rating, key){
    const badFlag = "Flagged as a bad search"
    const goodFlag = "Flagged as a good search"

    if(key === "conciseRating" && rating === "Bad"){
      this.setState( { conciseFlag: badFlag });
    } else if (key === "conciseRating" && rating === "Good"){
      this.setState( { conciseFlag: goodFlag });
    } else if (key === "compRating" && rating === "Bad"){
      this.setState( { compFlag: badFlag });
    } else if (key === "compRating" && rating === "Good"){
      this.setState( { compFlag: goodFlag });
    }
    
  }


  getSearches(data){
    var request = new XMLHttpRequest();
    request.open("POST", "http://localhost:5000/api/searches");
    request.setRequestHeader("Content-Type", "application/json");
    request.onload = function(){
      if(request.status === 200){
        var jsonString = request.responseText;
        var searches = JSON.parse(jsonString);
        // console.log(searches)
        this.setState( { searches: searches, conciseSearch: searches["concise"], comprehensiveSearch: searches["comprehensive"]} );
      }
    }.bind(this);
    request.send(JSON.stringify(data));
  }

  updateSearch(data){
    var request = new XMLHttpRequest();
    request.open("PUT", "http://localhost:5000/api/searches/" + this.state.searches._id["$oid"]);
    request.setRequestHeader("Content-Type", "application/json");
    request.onload = function(){
      if(request.status === 200){
        var jsonString = request.responseText;
        var searches = JSON.parse(jsonString);
        this.setState( { searches: searches} );
      }
    }.bind(this);
    request.send(JSON.stringify(data));
  }
  

  componentDidMount(){
    const url = "http://localhost:5000/api/profiles"
    fetch(url)
    .then((response) => response.json())
    .then((response) => this.setState( { profiles: response} ) );
  }

  render() {
    return (
        <main >
          <article className="App">
            <article className="input-area">
            <ProfileList 
              profiles={this.state.profiles}
              handleProfileSelected={this.handleProfileSelected.bind(this)}/> 
            <JobDesc
              handleJobDescSubmitted={this.handleJobDescSubmitted.bind(this)}>
            </JobDesc>
            <FeedbackForm 
            isOpen={this.props.isModalOpen} 
            onClose={() => this.props.closeModal()}
            closeModal={this.props.closeModal}>
            </FeedbackForm>
            </article>
            <article className="result-area">
                <Search 
                concSearch={this.state.conciseSearch}
                compSearch={this.state.comprehensiveSearch}
                conciseFlag={this.state.conciseFlag}
                compFlag={this.state.compFlag}
                handleRate={this.handleRate.bind(this)}/>
            </article>
          </article>
          <section className="feedback">
              <button id="feedback" onClick={() => this.props.openModal()}>What could be better?</button>
          </section>
        </main>
    );
  }
}

export default Functionality;
