<template>
<div class='container-fluid page-body-wrapper'>
    <div class="main-panel">
      <div class="content-wrapper">
        <section class="dashboard">
          <div class="row">
            <div class="col-12 grid-margin">
              <div class="card">
                <div class="card-body">
                  <h3 class="card-title mb-4">Attempts for {{game.title}}</h3>
                  <div class="table-responsive">
                    <table class="table center-aligned-table"  >
                      <tr class='games'>
                        <th>Full Name</th>
                        <th>Username</th>
                        <th></th>
                        <th></th>
                      </tr>
                    <tbody>
                      <tr v-for="attempt in attempts" :key="attempt.id">
                        <td>
                            <p>{{attempt.first_name}} {{attempt.last_name}}</p>
                        </td> 
                        <td>
                          <p>{{attempt.username}}</p>
                        </td>
                        <td>
                          <button @click="viewAttempt(attempt.id)" class="submit">View Attempt</button>
                        </td>
                        <td>
                          <button @click='deleteAttempt(attempt)' class="submit">Delete Attempt</button>
                        </td>
                      </tr>
                    </tbody>
                  </table>
                  <router-link to="/gamedashboard" class="submit" >
                    Back To Game Dashboard
                  </router-link>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>
      </div>
    </div>
  </div>
</template>

<script>
import { mapState } from 'vuex'
export default {
    name: 'attempts',
    computed: mapState({
        user: state => state.auth.user,
        game: state => state.auth.game,
        attempts: state => state.auth.gameAttempts,
        answers: state => state.auth.answers
    }),
    methods:{
        viewAttempt(id){
            this.$store.dispatch('showAttempt', id)
        },
        deleteAttempt(attempt){
            this.$store.dispatch('deleteAttempt', attempt)
        }
    }
}
</script>

<style scoped>
    .answer{
        font-size: 18pt;
    }
</style>