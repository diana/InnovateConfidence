<template>
    <div class="scenarios">
        <div class="game-div">
            <div class="router-div">
              <router-link to="/editgame" class="router-button">To Edit Game</router-link>
              <h1 class="game-title">Choose Card to Edit</h1>
              <router-link to="/gamedashboard" class="router-button">To Game Dashboard</router-link>
            </div>
            <div class="router-div">
              <router-link to="/createscenarios" class="add-button">Add Scenario</router-link>
            </div>
            <div class="flex" >
                <div class="card" v-for="scenario in scenarios" :key="scenario.id">
                    <div class="header">
                        <div class="title">
                            <div class="header-title">
                                <h1>{{scenario.title}}</h1>
                                <div class="edit-delete">
                                    <button 
                                        class="edit-button"
                                        @click="getScenario(scenario)"
                                    >
                                        Edit Card
                                    </button>
                                    <button 
                                        class="edit-button"
                                        @click="getEditQuestions(scenario)"
                                    >
                                        View Questions
                                    </button>
                                    <button 
                                        @click="deleteScenario(scenario)" 
                                        class="edit-button"
                                    >
                                        Delete
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div>
                        </div>
                    </div>
                    <div class="content">
                        <div class="closebar">
                            <h1>{{scenario.title}}...</h1>
                            <a href="#0" class="closebttn"><i class="material-icons">&#xE5CD;</i></a>
                        </div>
                        <p>{{scenario.description}}</p>
                        <div class="image">
                            <img :src="scenario.image" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import { mapState } from 'vuex'

export default {
    name: 'scenarios',
    computed:( 
        mapState({
            scenarios: state => state.auth.scenarios,
        })

    ),
    methods:{
        getScenario(scenario){
        this.$store.dispatch('getScenario', scenario)
        },
        deleteScenario(scenario){
            this.$store.dispatch('deleteScenario', scenario)
        },
        getEditQuestions(scenario){
            this.$store.dispatch('getEditQuestions', scenario)
        }
    }
}

</script>

<style scoped>

*,
*::before,
*::after {
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
}

body {
  height: 100%;
  width: 100%;
  padding: 0px;
  margin: 0;
  font-family: "Source Sans Pro", sans-serif;
  background-color: #011627;
  -webkit-font-smoothing: antialiased;
}

.flex {
  min-height: 80vh;
  display: flex;
  justify-content: space-evenly;
  flex-wrap: wrap;
}

.card {
  margin: 30px;
  width: 380px;
  height: 600px;
  position: relative;
  border-radius: 6px;
  overflow: hidden;
  background-color: #FDFFFC;
  box-shadow: 0 19px 48px rgba(0, 0, 0, 0.3), 0 15px 32px rgba(0, 0, 0, 0.22);
}
.card .header {
  height: 200px;
  width: 100%;
  background-color: #FDFFFC;
  position: relative;
  background-size: cover;
  background-position: center top;
  transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1) 0.3s;
}
.card .header.collapse {
  height: 0px;
}
.card .header .title {
  height: 200px;
  display: flex;
  align-items: center;
  text-align: center;
  justify-content: center;
  padding: 0px 15px;
  text-shadow: 4px 4px #D0EDF1; 

}
.card .header .title h1 {
  font-size: 38px;
  color: #011627;
}
.card .header .title h6 {
  font-size: 16px;
  color: #011627;
  margin: 0;
}
.card .header .title h6 span {
  color: #011627;
}

.card .content {
  height: 400px;
  width: 100%;
  overflow-x: hidden;
  padding: 20px 30px 30px 30px;
  position: relative;
  background-color: #011627;
  overflow-y: hidden;
  transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1) 0.3s;
  border-radius: 3px;
}
.card .content.full {
  height: 600px;
  overflow-y: scroll;
}
.card .content.full .articlemeta {
  transform: translateY(30px);
  opacity: 0;
}
.card .content.full .closebar {
  opacity: 1;
  transform: translateY(0px);
  transition: all 0.6s cubic-bezier(0.4, 0, 0.2, 1) 0.2s;
}
.card .content.full .closebar h1 {
  opacity: 1;
}
.card .content .closebar {
  padding: 0px 20px;
  transform: translateY(-30px);
  opacity: 0;
  border-top-left-radius: 6px;
  border-top-right-radius: 6px;
  transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1) 0.2s;
  position: absolute;
  width: 100%;
  height: 50px;
  line-height: 50px;
    background-color: #011627;
  top: 0;
  left: 0;
}
.card .content .closebar .closebttn {
  position: absolute;
  right: 15px;
  top: -2px;
}
.card .content .closebar h1 {
  transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1) 0.3s;
  opacity: 0;
  margin: 0px;
  padding: 0px;
  color: #FDFFFC;
  font-weight: bold;
  font-size: 18px;
}
.card .content .articlemeta {
  position: absolute;
  z-index: 99999;
  background: #FDFFFC;
  bottom: 0;
  left: 0;
  right: 0;
  padding-left: 3px;
  transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
}
.card .content .articlemeta:before {
  position: absolute;
  content: '';
  height: 40px;
  width: 100%;
  top: -41px;
}
.card .content .articlemeta ul {
  list-style-type: none;
  margin: 0px;
  padding: 0px;
}
.card .content .articlemeta ul.left {
  float: left;
}
.card .content .articlemeta ul.right {
  float: right;
}
.card .content .articlemeta ul li {
  display: inline-block;
  padding: 12px 15px 16px;
  cursor: pointer;
}
.card .content .articlemeta ul li:hover .material-icons {
  color: #644cad;
}
.card .content .articlemeta ul .material-icons {
  margin-right: 5px;
}
.card .content .bttn {
  display: block;
  padding: 10px 25px;
  text-align: center;
  border-radius: 3px;
  text-decoration: none;
  color: #D0EDF1;
  transition: 300ms all;
}
.card .content .bttn:hover {
    background-color: #011627;
}
.card .content .readmore {
  position: absolute;
  display: block;
  top: 0;
  bottom: 0;
  right: 0;
  left: 0;
  transition: 300ms all;
  color: #333;
}
.card .content .readmore:after {
  opacity: 0;
  text-align: center;
  content: 'Tap to read more';
  font-size: 22px;
  position: absolute;
  display: block;
  width: 50%;
  padding: 10px 25px;
background-color: #011627;
  left: 0;
  right: 0;
  margin-left: auto;
  margin-right: auto;
  top: 150px;
  transition: 300ms all;
  transform: translateY(20px);
}
.card .content .readmore:hover:after {
  opacity: 1;
  transform: translateY(0px);
  box-shadow: rgba(65, 92, 105, 0.0588235) 0px 1.5px 13px;
}
.card .content p {
  color: #D0EDF1;
}
.card .content p:first-of-type {
  margin-top: 0px;
}

@media (max-width: 767px) {
  .card .content .readmore:after {
    opacity: 1;
    text-align: center;
    content: 'Tap to read more';
    font-size: 22px;
    color: #EEE;
    position: absolute;
    display: block;
    width: 50%;
    padding: 10px 25px;
    background-color: #333;
    border: 1px solid #555;
    left: 0;
    right: 0;
    margin-left: auto;
    margin-right: auto;
    top: 150px;
    transition: 300ms all;
    transform: translateY(0px);
  }
}
.image{
    width: 100%;
    display: flex;
    justify-content: center;
    align-content: center;
}

img{
    width: 60%;
}
.router-div{
    width: 100%;
    justify-content: space-evenly;
    align-items: center;
}
.body-div{
    width: 100%;
    justify-content: space-evenly;
    align-items: flex-start;
    height: 15%;
    display: flex;
}
.scenarios{
    width: 75%;
}
.game-title{
    color: #FE4A49;
    padding: 50px;
    font-family: 'Roboto', sans-serif;
    font-size: 50px;
    margin: 0;
    text-shadow: 2px 2px #011627; 
}
.game-div{
    background-color: #FFCA3A;
    margin-bottom: 40px;
    opacity: 75%;
    border-radius: 3px;
}
.edit-button{
    text-decoration: none;
    color: #011627;
    font-size: 15pt;
    margin-top: 20px;
    background-color: #D0EDF1;
    border-radius: 3px;
    padding: 5px;
    margin-bottom: 10px;
}
.edit-button:hover{
    box-shadow: 0 19px 48px rgba(0, 0, 0, 0.3), 0 15px 32px rgba(0, 0, 0, 0.22);
    cursor: pointer;
}
.edit-delete{
    display: flex;
    flex-direction: row;
    justify-content: space-evenly;
    width: 100%;
}
.header-title{
    width: 100%;
    margin-bottom: 10px
}
.add-button{
  height: 50px;
  display: flex;
  align-items: center;
  text-align: center;
  justify-content: center;
  padding: 0px 15px;
  text-shadow: 4px 4px #D0EDF1; 
  font-size: 30px;
  color: #011627;
  background-color: #FDFFFC;
  border-radius: 6px;
  text-decoration: none;
  box-shadow: 0 19px 48px rgba(0, 0, 0, 0.3), 0 15px 32px rgba(0, 0, 0, 0.22);
}
.add-button:hover{
  cursor: pointer;
  text-shadow: 2px 2px #009FB7; 
  font-size: 30px;
  background-color: #011627;
  color: #FDFFFC;
  box-shadow: 0 19px 48px #FE4A49, 0 15px 32px rgba(0, 0, 0, 0.22);

}
</style>