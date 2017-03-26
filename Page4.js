'use strict'

import React ,{Component} from 'react';
import {
	StyleSheet,
	View,
} from 'react-native';
var NaviBar = require('./NaviBar');
var FLAnimatedImage = require('./FLAnimatedImage');
class Page4  extends Component {
	constructor(props) {
        super(props);
        this.onNaviBarPress = this.onNaviBarPress.bind(this);
    }

	render(){
		var naviStatus = [0,0,0,1];
		return (
			<View style = {styles.container}>
				<View style = {styles.naviTop} />
				<NaviBar naviBarStatus = {naviStatus}  onNaviBarPress = {this.onNaviBarPress} />
				
				<View style = {styles.whatLeft}>
				<FLAnimatedImage style = {styles.animatedImg} resizeMode = "contain" gifIndex = '3'> 		
				</FLAnimatedImage>
			    </View>
			</View>
	   );
	}

	onNaviBarPress(aNumber){
		switch(aNumber){
			case 0 :
			this.props.navigator.replace({name:'Page1'});
			return;
			case 1:
			this.props.navigator.replace({name:'Page2'});
			return;
			case 2:
			this.props.navigator.replace({name:'Page3'});
			return;
			case 3:
			return;
		}
	}
}

var styles = StyleSheet.create({
	container:{
		flex:1,
	},
	naviTop:{
		height:20,
	},
	whatLeft:{
		flex:1,
		borderTopWidth:1,
		borderColor:'black',
		backgroundColor:'blue',
	},

	animatedImg:{
		flex:1,
		backgroundColor:'red',
	},
});

module.exports = Page4;