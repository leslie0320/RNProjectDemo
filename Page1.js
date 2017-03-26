'use strict'
import React ,{Component} from 'react';
import {
	StyleSheet,
	View,
	StatusBar,
} from 'react-native';

var NaviBar = require('./NaviBar');
var FLAnimatedImage = require('./FLAnimatedImage');
class Page1  extends Component {
	constructor(props) {
        super(props);
        this.onNaviBarPress = this.onNaviBarPress.bind(this);
    }

	render(){
		var naviStatus = [1,0,0,0];
		return (
		<View style = {styles.container}>
			<View style = {styles.naviTop} />
			<NaviBar naviBarStatus = {naviStatus}  onNaviBarPress = {this.onNaviBarPress} />
			<View style = {styles.whatLeft}>
				<FLAnimatedImage style = {styles.animatedImg} resizeMode = "contain" gifIndex = '0'> 		
				</FLAnimatedImage>
			</View>
		</View>
		);
	}
	onNaviBarPress(aNumber){
		switch(aNumber){
			case 0 :
			return;
			case 1:
			this.props.navigator.replace({name:'Page2'});
			return;
			case 2:
			this.props.navigator.replace({name:'Page3'});
			return;
			case 3:
			this.props.navigator.replace({name:'Page4'});
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
		backgroundColor:'green',
	},
	animatedImg:{
		flex:1,
		backgroundColor:'red',
	},
});

module.exports = Page1;