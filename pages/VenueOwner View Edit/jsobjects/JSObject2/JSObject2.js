export default {
	myFun1: () => {
		{{GetVenues.run()}};
		
		{{SelectVenue.selectedOptionValue = -1}};
		{{GetRevenue.run()}};
		{{GetTickets.run()}};
	},
}