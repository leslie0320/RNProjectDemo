'use strict';
var Page1 = require('./Page1');
var Page2 = require('./Page2');
var Page3 = require('./Page3');
var Page4 = require('./Page4');
import React, {Component} from 'react';
import {
   AppRegistry,
   StyleSheet,
   Navigator,
   View,
} from 'react-native';
class  RNProjectDemo extends Component{
            constructor(props){
            super(props);
            this.renderScene = this.renderScene.bind(this);
      }

      render(){
            return(
            <Navigator initialRoute = {{name:'Page1'}} renderScene = {this.renderScene} />
            );
      }

      renderScene(router,navigator){
            switch(router.name)
            {
            case "Page1":
            return <Page1 navigator= {navigator} />;

            case "Page2":
            return <Page2 navigator= {navigator} />;

            case "Page3":
            return <Page3 navigator= {navigator} />;
            
            case "Page4":
            return <Page4 navigator= {navigator} />;
            }
      }
}

var styles = StyleSheet.create({
   container:{
      flex:1,
      backgroundColor:'red',
   },

});

AppRegistry.registerComponent('RNProjectDemo', () => RNProjectDemo);