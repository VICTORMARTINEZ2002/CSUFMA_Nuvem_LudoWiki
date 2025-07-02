<script setup lang="ts">
    import Carousel from 'primevue/carousel';
    import{ ref, onMounted } from "vue";
    import axios from '@/plugins/axios';

    const noticias = ref()
    onMounted(async () =>{
    try{
        const response = await axios.get('/noticias/')
        noticias.value = response.data
    }catch (error){console.log('Erro ao buscar noticias:', error)}
    })

    const responsiveOptions = ref([{
        breakpoint: '1400px',
        numVisible: 2,
        numScroll: 1
    },{
        breakpoint: '1199px',
        numVisible: 3,
        numScroll: 1
    },{
        breakpoint: '767px',
        numVisible: 2,
        numScroll: 1
    },{
        breakpoint: '575px',
        numVisible: 1,
        numScroll: 1
    }]);

</script>

<template>
  <main class="home-container">
    <img src='@/assets/logo.jpg' alt="Logo Ludo Wiki" class="logo" />
    
    <div class="carousel-container">
      <h1 class="secondary-title"> Últimas notícias </h1>
      <Carousel :value="noticias" :numVisible="3" :numScroll="1" :responsiveOptions="responsiveOptions" circular
        :autoplayInterval="3000">
        <template #item="slotProps">
          <div class="carousel-item">
            <h3 class="carousel-title">{{ slotProps.data.title }}</h3>
            <p class="carousel-body">{{ slotProps.data.body }}</p>
          </div>
        </template>
      </Carousel>
    </div>
  </main>
</template>

<style scoped>
.home-container{
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: flex-start;
  background-color: #ffffff;
}

.logo{
  max-width: 500px;
  width: 100%;
  height: auto;
  margin-bottom: 0rem;
}

.carousel-container{
  width: 100%;
  max-width: 900px;
  background-color: #ffffff;
  padding: 1.5rem;
  border-radius: 10px;
}

.secondary-title{
    color: black;
	text-align: center;
    margin-bottom: 10px;
}

.carousel-item{
  border: 1px solid #ddd;
  padding: 1.5rem;
  border-radius: 8px;
  background-color: #fafafa;
  height: 100%;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  margin: 0 12px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
}

.carousel-title{
  font-size: 1.2rem;
  font-weight: bold;
  margin-bottom: 0.5rem;
  color: #222;
}

.carousel-body{
  font-size: 1rem;
  color: #555;
}
</style>
