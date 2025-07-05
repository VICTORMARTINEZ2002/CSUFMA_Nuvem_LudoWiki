<script setup lang="ts">
import { RouterLink, RouterView } from 'vue-router'
import Menubar from 'primevue/menubar'
import { ref } from 'vue'

const items = ref([
    {label: 'Home',    icon: 'pi pi-home',        route: '/'},
    {label: 'Catalog', icon: 'pi pi-list',        route: '/catalog'},
    {label: 'About Us',   icon: 'pi pi-info-circle', route: '/about'}
])
</script>

<template>
	<header>
		<div class="card">
			<Menubar :model="items">
				<!-- Logo à esquerda -->
				<template #start>
					<img src="@/assets/icon.png" alt="Logo" class="logo-img" />
					<span style="font-size: 1.5rem;">LudoWiki</span>
				</template>
				<!-- Link router personalizado -->
				<template #item="{ item, props }">
					<router-link v-slot="{ href, navigate }" :to="item.route" custom>
						<a v-ripple :href="href" v-bind="props.action" @click="navigate">
							<span style="font-size: 1.5rem;" :class="item.icon"></span>
							<span>{{ item.label }}</span>
						</a>
					</router-link>
				</template>
			</Menubar>
		</div>
	</header>

	<RouterView />
</template>

<style scoped>
.logo-img{height:48px;}

.p-menubar {
	color: black;
	border-radius: 0;
	font-size: 1.5rem;
	background: #34d399;
}
.p-menubar .p-menuitem {
	border-radius: 0;
}

.p-menubar-item-link {
	color: black;

	&:hover {
		background-color: #34d399;
		border-radius: 1.15rem;
	}

	&:not(:hover) {
		background-color: #34d399;
	}
}
</style>
