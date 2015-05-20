/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 */
 'use strict';

 var React = require('react-native');
 var {
    AppRegistry,
    StyleSheet,
    Text,
    View,
} = React;

var requireNativeComponent = require('requireNativeComponent');

var TimerView = React.createClass({
    propTypes: {
        timerColor: React.PropTypes.string,
    },

    render() {
        return <TimerView {...this.props} />;
    }
});

var NativeTimerView = requireNativeComponent('TimerView', TimerView);

var REQUEST_URL = 'http://10.0.1.10:4567/status.json';

var PourOveriOS = React.createClass({
    getInitialState: function() {
        return {
            response: {},
        };
    },

    componentDidMount: function() {
        this.fetchData();
    },

    fetchData: function() {
        fetch(REQUEST_URL)
        .then((response) => response.json())
        .then((responseData) => {
            this.setState({
                response: responseData,
            });
            console.log(responseData);
        })
        .done();
    },

    render: function() {
        return (
            <View style={styles.container}>
                <NativeTimerView style={styles.timer} timerColor="#FF0000"></NativeTimerView>
          </View>
        );
    }
});

var styles = StyleSheet.create({
    container: {
        flex: 1,
        //justifyContent: 'center',
        alignItems: 'center',
        backgroundColor: '#F5FCFF',
    },
    timer: {
        width: 500,
        height: 500,
        backgroundColor: '#666666',
        color: '#000000',
    },
});

AppRegistry.registerComponent('PourOveriOS', () => PourOveriOS);
