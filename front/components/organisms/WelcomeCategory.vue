<template>
  <v-container class="category__container">
    <v-row>
      <v-col>
        <p class="category__tilte display-1 font-weight-bold">
          Category
        </p>
      </v-col>
    </v-row>
    <v-row justify="center">
      <v-col
        v-for="card in cards"
        :key="card.title"
        :cols="card.flex"
      >
        <v-card
          rounded="circle"
          height="150px"
          width="150px"
        >
          <v-img
            :src="card.src"
            class="white--text align-end"
            gradient="to bottom, rgba(0,0,0,.1), rgba(0,0,0,.5)"
            height="150px"
            width="150px"
            aspect-ratio="1"
          >
            <v-card-title v-text="card.title" />
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
      { title: 'Pre-fab homes', src: 'https://cdn.vuetifyjs.com/images/cards/house.jpg', flex: 3 },
      { title: 'Favorite road trips', src: 'https://cdn.vuetifyjs.com/images/cards/road.jpg', flex: 3 },
      { title: 'Best airlines', src: 'https://cdn.vuetifyjs.com/images/cards/plane.jpg', flex: 3 },
      { title: 'Pre-fab homes', src: 'https://cdn.vuetifyjs.com/images/cards/house.jpg', flex: 3 }
    ]
  })
}
</script>

<style>
.category__container {
  padding: 40px 0 40px 0;
}
</style>
