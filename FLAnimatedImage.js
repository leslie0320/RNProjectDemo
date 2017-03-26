'use strict';
import React, {Component} from 'react';
import {
    requireNativeComponent,
    NativeModules,
    StyleSheet,
    View,
    Text,
} from 'react-native';

var {
    ScaleToFill,
    ScaleAspectFit,
    ScaleAspectFill,
} = NativeModules.RNFLAnimatedImageManager;

var MODES = {
    'strench':ScaleToFill,
    'contain':ScaleAspectFit,
    'cover'  :ScaleAspectFill,
};
var RNFLAnimatedImage = requireNativeComponent('RNFLAnimatedImage',null);
class FLAnimatedImage extends Component{
    constructor(props){
        super(props);
        this.state = {
            currentFrameIndex:0,
        };
        this._viewHandler = this._viewHandler.bind(this);
    }

    _viewHandler(event){
        // console.log('React事件' + event.nativeEvent.myData);
        var currentFrameIndex = event.nativeEvent.myData.currentFrameIndex;
        this.setState((state) => {
            return {
               currentFrameIndex:currentFrameIndex,
            }
        });
    }

    render(){
       var contentMode = MODES[this.props.resizeMode] || MODES.strench;
        return(
            <View style = {styles.container}>
                <View style = {styles.viewContainer}>
                    <Text style = {styles.textContainer}>
                        {this.state.currentFrameIndex}
                    </Text>
                </View>
                <RNFLAnimatedImage 
                    style = {styles.animatedImg}  
                    {... this.props} 
                    contentMode = {contentMode} 
                    onViewHandler = {this._viewHandler}/>
            </View>
        );
    }
}

FLAnimatedImage.PropTypes = {
    src:React.PropTypes.string,
    contentMode:React.PropTypes.number,
    resizeMode:React.PropTypes.string,
    viewHandler:React.PropTypes.func.isRequired,
    ...View.propTypes
};

var styles = StyleSheet.create({
    container:{
        flex:1,
    },
    animatedImg:{
        flex:1,
    },
    viewContainer:{
        height:200,
        justifyContent:'center',
        alignItems:'center',
        backgroundColor:'white',
    },
    textContainer:{
        fontSize:50,
    },
});
module.exports = FLAnimatedImage;