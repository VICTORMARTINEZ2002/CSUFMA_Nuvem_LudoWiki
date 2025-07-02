<script setup lang="ts">
import { RouterLink, RouterView } from 'vue-router'
import Menubar from 'primevue/menubar'
import { ref } from 'vue'

const items = ref([
	{label: 'Home',	icon: 'pi pi-home',	route: '/'	},
	{label: 'Catalog',	icon: 'pi pi-list',	route: '/catalog'},
	{label: 'About',	icon: 'pi pi-info-circle',	route: '/about'}
])
</script>

<template>
	<header>
		<div class="card">
			<Menubar :model="items">
				<!-- Logo à esquerda -->
				<template #start>
					<img src="@/assets/logo.jpg" alt="Logo" height="32" class="logo-img" />
				</template>

				<!-- Link router personalizado -->
				<template #item="{ item, props, hasSubmenu }" #end>
					<router-link v-if="item.route" v-slot="{ href, navigate }" :to="item.route" custom>
						<a v-ripple :href="href" v-bind="props.action" @click="navigate">
							<span :class="item.icon" style="margin-right: 0.5rem" />
							<span>{{ item.label }}</span>
						</a>
					</router-link>
					<a v-else v-ripple :href="item.url" :target="item.target" v-bind="props.action">
						<span :class="item.icon" style="margin-right: 0.5rem" />
						<span>{{ item.label }}</span>
						<span v-if="hasSubmenu" class="pi pi-fw pi-angle-down" />
					</a>
				</template>

			</Menubar>
		</div>
	</header>

	<RouterView />
</template>

<style scoped>
.logo-img{height:32px;}
</style>
