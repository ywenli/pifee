<template>
  <v-container class='popular__container'>
    <v-row>
      <v-col>
        <p class='popular__title display-1 font-weight-bold'>
          Popular
        </p>
      </v-col>
    </v-row>
    <v-row>
      <v-col
        v-for='card in cards'
        :key='card.title'
        :cols='card.flex'
      >
        <v-card>
          <v-img
            :src='card.src'
            class='white--text align-end'
            gradient='to bottom, rgba(0,0,0,.1), rgba(0,0,0,.5)'
            height='200px'
          >
            <v-card-title v-text='card.title' />
          </v-img>
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
export default {
  data: () => ({
    cards: [
      { title: 'Pre-fab homes', src: 'https://cdn.vuetifyjs.com/images/cards/house.jpg', flex: 4 },
      { title: 'Favorite road trips', src: 'https://cdn.vuetifyjs.com/images/cards/road.jpg', flex: 4 },
      { title: 'Best airlines', src: 'https://cdn.vuetifyjs.com/images/cards/plane.jpg', flex: 4 }
    ]
  })
}
</script>

<style>
.popular__container {
  padding: 40px 0 40px 0;
}
</style>
