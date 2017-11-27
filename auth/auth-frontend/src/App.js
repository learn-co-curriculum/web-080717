import React from 'react';
import {Route, withRouter, Switch} from 'react-router-dom'
import ProfileComponent from './components/Profile'
import LoginForm from './components/LoginForm'
import Navigation from './components/Navigation'
import {connect} from 'react-redux'
import {getCurrentUser, logOutUser} from './actions/user'
import {getLocation, setLocation, rewindLocationState} from './actions/location'
import authorize from './authorize'

class App extends React.Component {

  componentDidMount() {
    if (localStorage.getItem('jwt')) {
      this.props.getCurrentUser()
    }
    this.props.getLocation()
  }




  render() {
    console.log(this.props.locationHistory)
    const AuthLoginForm = authorize(LoginForm)
    const AuthProfile = authorize(ProfileComponent)

    const prevStates = this.props.locationHistory.map((lh,i) => (
      <div>
        <button onClick={() => this.handleUndoState(i)}>{i}</button>: <span>{lh.get('latitude')}</span> <span>{lh.get('longitude')}</span> <span>{lh.get('currentTime')}</span>
      </div>
    ))

    return (
      <div className="App">
        <Navigation/>
        <button name="lat++" onClick={this.handleCoordsClick}>Lat++</button><button name="lat--" onClick={this.handleCoordsClick}>Lat--</button>
        <button name="long++" onClick={this.handleCoordsClick}>Long++</button><button name="long--" onClick={this.handleCoordsClick}>Long--</button>
        {prevStates}




        <Switch>
        <Route exact path='/' render={() => (
            <div>
              hey {this.props.user.get('loading') ? "Downloading Internet..." : this.props.user.get('username')}
            <div>{this.props.location.get('loadingLocation') ? "Finding Location" : "Location Found"}</div>
            </div>)}/>
        <Route exact path='/map' render={() => <div>Mapppppppp</div>}/>

        <Route exact path='/profile' component={AuthProfile}/>
        <Route exact path='/login' render={(props) => <AuthLoginForm onSubmit={this.logIn} {...props}/>}/>
        <Route render={() => <div>No MATTTTTTCH</div>}/> />
        </Switch>

        <h1><span>{this.props.location.get('latitude')}</span>, <span>{this.props.location.get('longitude')}</span></h1>

      </div>
    )
  }

  handleUndoState = (i) => {
    this.props.rewindLocationState(i)
  }
  handleCoordsClick = (event) => {
    let lat = this.props.location.get('latitude')
    let long = this.props.location.get('longitude')
    switch (event.target.name) {
      case "lat++":
        lat = lat + 1
        break
      case "lat--":
        lat = lat - 1
        break
      case "long++":
        long = long + 1
        break
      case "long--":
        long = long - 1
        break
      default:
        break
    }
    this.props.setLocation({coords: {latitude: lat, longitude: long}})
  }

}

const mapStateToProps = state => {
  return {
  user: state.get('usersReducer'),
  location: state.get('locationReducer').last(),
  locationHistory: state.get('locationReducer')
}}


export default withRouter(connect(mapStateToProps, {getCurrentUser, getLocation, setLocation, rewindLocationState, logOutUser})(App));







//
