import React from 'react';
import { createStore,  applyMiddleware } from 'redux'
import { Provider } from 'react-redux'
import thunk from 'redux-thunk'
import { composeWithDevTools } from 'redux-devtools-extension'
import ReactDOM from 'react-dom'
import { BrowserRouter as Router } from 'react-router-dom'
import {combineReducers} from 'redux-immutable';
import Immutable from 'immutable';
import App from './App';
import usersReducer from './reducers/usersReducer'
import locationReducer from './reducers/locationReducer'
import registerServiceWorker from './registerServiceWorker';

const rootReducer = combineReducers({ usersReducer, locationReducer })

const store = createStore(rootReducer, composeWithDevTools(applyMiddleware(thunk)))

ReactDOM.render(<Provider store={store}><Router><App /></Router></Provider>, document.getElementById('root'));
registerServiceWorker();
