import React from 'react';
import {Route, withRouter} from 'react-router-dom'
import ProfileComponent from './components/Profile'
import LoginForm from './components/LoginForm'
import Navigation from './components/Navigation'
import {connect} from 'react-redux'
import {getCurrentUser, logOutUser} from './actions/user'
import {getLocation} from './actions/location'
import authorize from './authorize'


class App extends React.Component {

  componentDidMount() {
    if (localStorage.getItem('jwt')) {
      this.props.getCurrentUser()
    }
    this.props.getLocation()
  }

  render() {
    const AuthLoginForm = authorize(LoginForm)
    const AuthProfile = authorize(ProfileComponent)

    return (
      <div className="App">
        <Navigation/>
        <Route exact path='/' render={() => (
            <div>
              hey {this.props.usersReducer.loading ? "Downloading Internet..." : this.props.usersReducer.username}
              <div>{this.props.locationReducer.loadingLocation ? "Finding Location" : "Location Found"}</div>
            </div>)}/>
        <Route exact path='/map' render={() => <div>Mapppppppp</div>}/>
        <Route exact path='/profile' component={AuthProfile}/>
        <Route exact path='/login' render={(props) => <AuthLoginForm onSubmit={this.logIn} {...props}/>}/>



      </div>
    )
  }
}

const mapStateToProps = ({usersReducer, locationReducer}) => ({ usersReducer, locationReducer })


export default withRouter(connect(mapStateToProps, {getCurrentUser, getLocation, logOutUser})(App));







//
