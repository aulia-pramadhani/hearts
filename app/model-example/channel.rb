# == Schema Information
#
# Table name: channels
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  url          :string(255)
#  not_in_id    :boolean
#  slug         :string(255)
#  image        :string(255)
#  description  :text
#  time_zone_id :integer          default(1), not null
#

require 'digest/md5'
require_relative 'channel_blocking'
require_relative 'channel_blocking_period'

class Channel < ActiveRecord::Base  

  belongs_to :time_zone
  has_many :show_programs, :dependent => :delete_all
  has_many :channel_blockings, :dependent => :delete_all

  attr_accessible :id, :name, :url, :slug, :not_in_id, :description,
    :time_zone_id,
    :image, :image_cache, :remove_image,
    :embed,
    :background, :background_cache, :remove_background,
    :embed_logo_watermark, :embed_logo_watermark_cache, :remove_embed_logo_watermark,
    :top_banner, :right_banner, :stretch_button, #je09213urF
    :embed_free_player, :embed_restricted_player,
    :embed_free_preroll_ads, :embed_restricted_preroll_ads, :homepage_preroll_ads,
    :embed_free_midroll_ads, :embed_restricted_midroll_ads, :homepage_midroll_ads,
    :show_on_mobile,
    :hls_mobile_url, :hls_mobile_id_url,
    :rtsp_mobile_url, :rtsp_mobile_id_url,
    :rtsp_mobile_url_hd, :rtsp_mobile_id_url_hd,
    :hls_mobile_url_hd, :hls_mobile_id_url_hd,
    :mobile_preroll_ads,
    :embed_free_midroll_period, :embed_restricted_midroll_period, :homepage_midroll_period,
    :embed_free_video_ads_in_id, :embed_restricted_video_ads_in_id, :homepage_video_ads_in_id, :mobile_video_ads_in_id,
    :mobile_midroll_ads, :mobile_midroll_period


  validates :name, :url, :slug, :presence => true, :uniqueness => true

  def key
    url ? Digest::MD5.hexdigest(url) : ''
  end
  
end