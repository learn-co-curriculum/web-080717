import {fromJS} from 'immutable'

export const initialState = fromJS({ username: null, loading: false, errorMessage: null, loggedIn: false })


export default function usersReducer(state = initialState, action) {
  switch (action.type) {
    case "GETTING_USER":
      return state.set('loading', true)
      //return {...state, loading: true}
    case "LOGIN_USER":
      localStorage.setItem('jwt', action.payload.jwt)
      return state
              .set('username', action.payload.username)
              .set('errorMessage', null)
              .set('loading', false)
              .set('loggedIn', true)
      // return {...state, username: action.payload.username, errorMessage: null, loading: false, loggedIn: true}
    case "LOGIN_ERROR":
      return state
              .set('errorMessage', action.payload.message)
              .set('loading', false)
              .set('loggedIn', false)
      // return {...state, errorMessage: action.payload.message, loading: false, loggedIn: false}
    case "SET_CURRENT_USER":
      return state
              .set('username', action.payload.username)
              .set('errorMessage', action.payload.message)
              .set('loading', false)
              .set('loggedIn', true)
      // return {...state, username: action.payload.username, errorMessage: action.payload.message, loading: false, loggedIn: true}
    case "LOG_OUT_USER":
      return state
              .set('username', null)
              .set('errorMessage', null)
              .set('loading', false)
              .set('loggedIn', false)
      // return {...state, username: null, errorMessage: null, loading: false, loggedIn: false}
    default:
      return state
  }
}
